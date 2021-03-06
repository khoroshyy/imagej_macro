macro "mac agg" {dir = getDirectory("Choose Source Directory");
  list = getFileList(dir);
  for (i=0; i<list.length; i++) {
     open(dir+list[i]);
run("8-bit");
  setAutoThreshold("Default");
run("Threshold...");
     waitForUser("Adjust threshold, then click 'OK' ");
  run("Analyze Particles...", "size=50-Infinity display exclude include summarize");close ();}
  if (nResults != 0){ 
        for (i=0; i<nResults; i++){ 
                resLabel = getResultLabel(i); 
                if (indexOf(resLabel, ".tif") > 0) { 
                        resLabel = substring (resLabel, 0, lastIndexOf(resLabel,".tif")); // remove the ".tif" in the text string 
                        n = lengthOf(resLabel); // number of characters in the text string 
                        LBL = substring (resLabel, 0, n-2); // remove the last 2 characters to get the label 
                        section = substring (resLabel, n-1, n); // remove all text in label except last character 
                        setResult("Label", i, LBL); // set the text string for new label 
                        setResult("Section", i, section); // set the text string for section 
                } 
} else { 
        showMessage("No Result found in result table"); 
} 
  selectWindow("Results");
  saveAs("Measurements", "D:\\test.xls"); 
close();close();close();
};