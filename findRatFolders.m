function ratFolderList = findRatFolders(parentDirectory)

currentDir = pwd;

cd(parentDirectory)
ratFolderList = listFolders('R*');

cd(currentDir);

