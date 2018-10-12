%%
rootPath = '/Volumes/Tbolt_01/Skilled Reaching/deeplabcut_calibration_images';
viewDirs = {'direct','left','right','top'};


for iView = 1 : length(viewDirs)
    
    pngPath = fullfile(rootPath,viewDirs{iView});
    metadata_name = ['calibration_images_' viewDirs{iView} '_metadata.mat'];
    cd(pngPath)

    if exist(metadata_name,'file')
        load(metadata_name)
    end
    pngList = dir('*.png');
    oldNames = cell(1,length(pngList));

    for ii = 1 : length(pngList)
        newName = sprintf('%03d.png',ii);
        oldNames{ii} = pngList(ii).name;

        movefile(oldNames{ii},newName);
    end

    save(metadata_name,'oldNames');
    
end

    