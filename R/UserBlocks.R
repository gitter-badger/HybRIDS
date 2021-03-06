#' @title UserBlocks reference class
#' @name UserBlocks
#' @description 
#' The UserBlocks reference class is the class used to store and manipulate user defined blocks in HybRIDS.
UserBlocks <- setRefClass("UserBlocks",
                          
                          fields = list(
                            Pairs = "list"
                            ),
                          
                          methods = list(
                            initialize =
                              function(){
                                Pairs <<- list()
                              },
                            
                            hasPairs =
                              function(){
                                return(length(Pairs) > 0)
                              },
                            
                            enforceUserBlocks =
                              function(){
                                if(!hasPairs()){"Error: UserBlocks object has not been initialized from a HybRIDSseq object."}
                              },
                            
                            initializePairsFromDNA =
                              function(dna){
                                if(class(dna) != "HybRIDSseq"){stop("Object provided is not of class HybRIDSseq")}
                                pairs <- unlist(lapply(combn(unique(dna$getSequenceNames()),2, simplify=F), function(x) paste(x[1], x[2], sep=":")))
                                for (i in pairs){
                                  Pairs[[i]] <<- data.frame(FirstBP=as.numeric(), LastBP=as.numeric(), ApproxBpLength=as.numeric(), SNPs=as.numeric(), CorrectedSNPs=as.numeric(), P_Value=as.numeric(),
                                                            P_Threshold=as.numeric(), fiveAge=as.numeric(), fiftyAge=as.numeric(), ninetyFiveAge=as.numeric())
                                }
                              },
                            
                            addBlock =
                              function(first, last, pair){
                                enforceUserBlocks()
                                index <- processPair(pair)
                                bplength <- abs(last-first)+1
                                Pairs[[index]] <<- rbind(Pairs[[index]], c(first, last, bplength, NA, NA, NA, NA, NA, NA, NA))
                                names(Pairs[[index]]) <<- c("FirstBP", "LastBP", "ApproxBpLength", "SNPs", "CorrectedSNPs", "P_Value", "P_Threshold",
                                                            "fiveAge", "fiftyAge", "ninetyFiveAge")
                              },
      
                            blankBlocks = function(pair){
                              enforceUserBlocks()
                              index <- processPair(pair)
                              Pairs[[index]] <<- data.frame(FirstBP=as.numeric(), LastBP=as.numeric(), ApproxBpLength=as.numeric(), SNPs=as.numeric(), CorrectedSNPs=as.numeric(), P_Value=as.numeric(),
                                                            P_Threshold=as.numeric(), fiveAge=as.numeric(), fiftyAge=as.numeric(), ninetyFiveAge=as.numeric())
                            },
                            
                            processPair =
                              function(instring){
                                selections <- unlist(strsplit(instring, ":"))
                                if(length(selections) != 2){stop("You must specify two sequences, between which your recombination event occured.")}
                                options <- strsplit(names(Pairs), ":")
                                index <- which(unlist(lapply(lapply(options, function(x) selections %in% x), function(y) all(y))))
                                if(length(index) != 1){stop("Something has gone wrong indexing pairs in triplets - this scenario should not happen, the index of more than or less than one pair should not be possible, contact package maintainer.")}
                                return(index)
                              },
                            
                            dateBlocks =
                              function(sequences, parameters){
                                for(i in 1:length(Pairs)){
                                  if(nrow(Pairs[[i]]) > 0){
                                    pair <- which(sequences$getSequenceNames() %in% unlist(strsplit(names(Pairs)[i], ":")))
                                    #dated <- date.blocks(Pairs[[i]], sequences, blockdatingparameters$MutationRate, pair, blockdatingparameters$PValue, blockdatingparameters$BonfCorrection, blockdatingparameters$DateAnyway)
                                    Pairs[[i]] <<- date.blocks(Pairs[[i]], sequences, parameters$MutationRate, pair, parameters$PValue, parameters$BonfCorrection, parameters$DateAnyway, parameters$MutationCorrection)
                                    #Pairs[[i]] <<- cbind(Pairs[[i]], dated)
                                  }
                                }
                              },
                            
                            tabulateBlocks = 
                              function(){
                                return(do.call(rbind, Pairs))
                              }
                            ))
