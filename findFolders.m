function ratFolderList = findFolders(parentDirectory,searchString)

currentDir = pwd;

cd(parentDirectory)
folderList = listFolders(searchString);

cd(currentDir);

