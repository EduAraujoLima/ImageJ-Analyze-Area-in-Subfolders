urlPastaColeta = getDirectory("Selecione a coleta")
setBatchMode(true);
count = 0;
countFiles(urlPastaColeta);
n = 0;
processFiles(urlPastaColeta);

function countFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              countFiles(""+dir+list[i]);
          else
              count++;
      }
  }

   function processFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              processFiles(""+dir+list[i]);
          else {
             showProgress(n++, count);
             path = dir+list[i];
             processFile(path);
          }
      }
  }

  function processFile(path) {
       if (endsWith(path, ".jpeg")) {
           open(path);
            run("Set Scale...", "distance=82 known=1 unit=cm");
           run("8-bit") ;
           run("Make Binary");
           run("Analyze Particles...", "size=10-Infinity circularity=0.00-1.00 show=Outlines display exclude summarize");
           close();
      }
  }
  
