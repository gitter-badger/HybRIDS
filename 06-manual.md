---
layout: manualsection
title: Scanning triplets for recombination signal
permalink: 06-manual.html
manual: true
published: true
status: publish
---
 

 
This step can be started by using the `analyzeSS()` method of the HybRIDS object.
 As a reminder the parameters of the step are:
 
 
 
Again these settings are described in the previous manual page, but by adjusting the WindowSize and Step size you adjust the size (in base pairs),
and the number of steps (in base pairs) that the sliding window slides along the Triplets during the analysis.
 
The SSAnalysis step is run very simply with the `analyzeSS()` method:
 
Without any arguments, the `analyzeSS()` method will run the analysis for all triplets.
 
The analyzeSS method will analyse all the triplets by default, but you can also specify a triplet(s) to analyse:
This is useful if you have perhaps run the method for all your triplets (assuming you have more than one) and 
you've found few triplets in which you might try different window and step sizes to see if you can get different 
or better results. Here is a 10 Sequence example called "MyAnalysis2" to illustrate how this is done:
 
```
#Create the new HybRIDS object for a fasta file with 10 aligned sequences.
> MyAnalysis2 <- HybRIDS$new("~/Desktop/10Sequences.fasta")
 
Looking for duplicates...
 
#Make the triplet combinations or SSAnalysis step.
> MyAnalysis2$makeTripletCombos()
#Check out the MyAnalysis2 object before continuing.
> MyAnalysis2
HybRIDS object - Analysis of  10  aligned sequences.
 
DNA Alignment:
--------------
Full Sequence File Location:  /var/folders/kp/clkqvqn9739ffw2755zjwy74_skf_z/T//Rtmpqg9BMs/FullSequencec3d33691c805 
Informative Sequence File Location:  /var/folders/kp/clkqvqn9739ffw2755zjwy74_skf_z/T//Rtmpqg9BMs/InformativeSequencec3d31ce2dc40
Full Length:  400000 
Informative Length:  33043 
Sequence names:  Seq1 Seq2 Seq3 Seq4 Seq5 Seq6 Seq7 Seq8 Seq9 Seq10 
 
Triplet Generation Parameters:
------------------------------
Triplet Generation Method: 1
Threshold for method number 2: 0.01
 
Sequence Similarity Analysis Parameters:
----------------------------------------
Sliding Window Size: 100
Sliding Window Step Size: 1
 
Block Detection Parameters: 
---------------------------
Manual Thresholds: 90
HybRIDS will attempt automatic detection of SS Thresholds for putative block searches.
HybRIDS will fall back on user specified manual thresholds, should the autodetection fail.
 
Block Dating Parameters:
------------------------
Assumed mutation rate: 1e-07
P-Value for acceptance of putative blocks: 0.005
 
 120 Have been generated for analysis.
```
 
Now the example is set up, there's a 10 sequence (120 Triplet) HybRIDS object ready for sequence similarity analysis.
 
There are several methods in HybRIDS which can take a triplet selection as an option. 
To specify a triplet selection in HybRIDS, type out the sequence names, separated by semi-colons like so:
`"Seq1:Seq2:Seq3"`. This will select our first triplet in the MyAnalysis2 example. Note the order does not matter,
it could be `"Seq2:Seq1:Seq3"` or even `"Seq3:Seq2:Seq1"`.
 
So let's analyse only the Triplet `"Seq1:Seq2:Seq3"`. This is done like so:
 
```R
> MyAnalysis2$analyzeSS("Seq1:Seq2:Seq3")
Now analysing sequence similarity of triplet 1 2 3 
```
 
What if you want to do more than one selection? This is done by suppling a vector of several selections,
for example: `MyAnalysis2$analyzeSS(c("Seq1:Seq2:Seq3","Seq1:Seq2:Seq4","Seq1:Seq2:Seq5"))`.
 
Check the R documentation for use of the c() function - in short it is a concatenation function and you use 
it when you want to join several things into a vector - in this case we make a vector of our three triplet selections 
to give to HybRIDS.
 
There is an alternative shorthand to specifying Triplets in HybRIDS: say you wanted to analyze all the triplets that contained the two sequences called "Seq1" and "Seq2". You could do this:
 
```R
> MyAnalysis2$analyzeSS(c("Seq1:Seq2:Seq3","Seq1:Seq2:Seq4","Seq1:Seq2:Seq5","Seq1:Seq2:Seq6","Seq1:Seq2:Seq7","Seq1:Seq2:Seq8","Seq1:Seq2:Seq9","Seq1:Seq2:Seq10"))
Now analysing sequence similarity of triplet 1 2 3 
Now analysing sequence similarity of triplet 1 2 4 
Now analysing sequence similarity of triplet 1 2 5 
Now analysing sequence similarity of triplet 1 2 6 
Now analysing sequence similarity of triplet 1 2 7 
Now analysing sequence similarity of triplet 1 2 8 
Now analysing sequence similarity of triplet 1 2 9 
Now analysing sequence similarity of triplet 1 2 10 
```
 
But that gets awful to type out very quickly. In HybRIDS the shorthand for the above is this: `"Seq1:Seq2"` This amounts to telling HybRIDS The triplet must contain Seq1 and Seq2, and the third sequence is not specified so do it for all triplets with those two sequences.
Once again you could type this in any order: `"Seq1:Seq2"`, `"Seq2:Seq1"`. To demonstrate with an example:
 
```R
> MyAnalysis2$analyzeSS("Seq1:Seq2")
Now analysing sequence similarity of triplet 1 2 3 
Now analysing sequence similarity of triplet 1 2 4 
Now analysing sequence similarity of triplet 1 2 5 
Now analysing sequence similarity of triplet 1 2 6 
Now analysing sequence similarity of triplet 1 2 7 
Now analysing sequence similarity of triplet 1 2 8 
Now analysing sequence similarity of triplet 1 2 9 
Now analysing sequence similarity of triplet 1 2 10
```
 
In the example, HybRIDS does the analysis for all triplets of the 120 that contain both the first sequence and the 
second sequence (called "Seq1" and "Seq2" respectively).
 
---
 
 
Step 3: Block Detection Step
----------------------------
 
Identification of putative recombination blocks in triplets in HybRIDS is done using the findBlocks method, continuing with our MyAnalysis example:
 
```R
> test$findBlocks()
Only one triplet to find the potential blocks in...
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
```
 
Again before using this method you can view and change the settings for that step.
 
As with the analyzeSS method, you can specify which triplets to find the blocks in:
 
```R
test$findBlocks("Seq1:Seq2:Seq3")
Now finding potential blocks in triplet 1 2 3 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
```
 
if you only use two sequence names - HybRIDS will perform the task but for all the triplets containing that pair of sequences. To demonstrate this with the 10 sequence example - MyAnalysis2:
 
```R
> MyAnalysis2$findBlocks("Seq1:Seq2")
Now finding potential blocks in triplet 1 2 3 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Falling back to manual thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 4 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Falling back to manual thresholds...
Falling back to manual thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 5 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 6 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Falling back to manual thresholds...
Falling back to manual thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 7 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 8 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 9 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Falling back to manual thresholds...
Now beginning Block Search...
 
Now finding potential blocks in triplet 1 2 10 
Using the autodetect thresholds method...
Deciding on suitable thresholds...
Now beginning Block Search...
```
 
The default options for this step will direct HybRIDS to try and auto-detect suitable sequence similarity 
thresholds for block detection, but will also fallback to the manual thresholds specified by 
the user should it not find any, this is default as it does not interrupt workflow should you 
be trying to run this for many triplets - all that will happen is HybRIDS falls back to the manual 
thresholds and then fails or succeeds to find blocks at those thresholds. 
 
---
 
Step 4: Block Dating (and Significance Testing)
-----------------------------------------------
 
Testing the significance and dating the blocks is as easy as it is to detect them. To do this use the dateBlocks method as demonstrated below:
 
```R
> MyAnalysis$dateBlocks()
Only one triplet to date blocks in...
Now dating blocks
```
 
Once again as with the analyzeSS and findBlocks methods, by default all triplets will be done, but you can provide a selection:
 
```R
> MyAnalysis$dateBlocks("Seq1:Seq2:Seq3")
Now dating blocks in triplet 1 2 3 
Now dating blocks
```
 
To demonstrate with the 10 sequence example - MyAnalysis2:
 
```R
> MyAnalysis2$dateBlocks("Seq1:Seq2")
Now dating blocks in triplet 1 2 3 
Now dating blocksNow dating blocks in triplet 1 2 4 
Now dating blocksNow dating blocks in triplet 1 2 5 
Now dating blocksNow dating blocks in triplet 1 2 6 
Now dating blocksNow dating blocks in triplet 1 2 7 
Now dating blocksNow dating blocks in triplet 1 2 8 
Now dating blocksNow dating blocks in triplet 1 2 9 
Now dating blocksNow dating blocks in triplet 1 2 10 
Now dating blocks
```
 
This will only test the significance of, and date significant blocks, for all triplets that contain both Seq1 and Seq2.
 
In ending this section, the main workflow and analysis process of HybRIDS has been covered.
The next step is really to decide how to view, assess and output your results. This is what will be covered in the next section.