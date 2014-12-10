JsOsaDAS1.001.00bplist00�Vscript_ufunction runHybRIDS(){
	R.windows[0].miniaturized = true;
	R.cmd("chooseCRANmirror(ind = 83)");
    R.cmd("pkg <- c('devtools', 'shiny', 'ggplot2', 'grid', 'gridExtra', 'ape', 'Rcpp')"); 
	R.cmd("new.pkg <- pkg[!(pkg %in% installed.packages())]");
	R.cmd("if(length(new.pkg)){install.packages(new.pkg)}");
	R.cmd("if(!'HybRIDS' %in% installed.packages()){library(devtools); install_github('Ward9250/HybRIDS')}");
	R.cmd("if(!'shinyBS' %in% installed.packages()){library(devtools); install_github('ebailey78/shinyBS')}");
	R.cmd("library(shiny)");
	R.cmd("library(shinyBS)");
	R.cmd("runGitHub('HybRIDSapp', 'Ward9250', launch.browser = TRUE)");
}

function updateHybRIDS(){
	R.cmd("chooseCRANmirror(ind = 83)");
    R.cmd("pkg <- c('devtools', 'shiny', 'ggplot2', 'grid', 'gridExtra', 'ape')");
	R.cmd("install.packages(pkg)");
	R.cmd("library(devtools); install_github('ebailey78/shinyBS'); install_github('Ward9250/HybRIDS')");
	R.cmd("q(save = 'no')");
}

App = Application.currentApplication();
App.includeStandardAdditions = true;
update = App.displayDialog('Run HybRIDS or install / force an update?', {
	withTitle: 'HybRIDS - Recombination detection and dating',
	buttons: ['Run HybRIDS', 'Install / update']});
if(update.buttonReturned == 'Run HybRIDS'){
	R = Application("R");
	runHybRIDS();
}
if(update.buttonReturned == 'Install / update'){
	R = Application("R");
	updateHybRIDS();
}


                              � jscr  ��ޭ