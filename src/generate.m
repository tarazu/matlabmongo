function generate()

system('rm -r gen')

libLoc = '/usr/local/lib/';
path = getenv('PATH');
setenv('PATH', [libLoc ';' path]);

includePath = ["/usr/local/include/bsoncxx/v_noabi/", ...
    "/usr/local/include/mongocxx/v_noabi/"];
headerFiles = ["mongocxx_wrapper.h"];
outputFolder = "gen";
libraries = [fullfile(libLoc, "libbsoncxx.so._noabi"), ...
    fullfile(libLoc, "libmongocxx.so._noabi")];

clibgen.generateLibraryDefinition(headerFiles, "IncludePath", includePath, ...
    'Libraries', libraries, 'OutputFolder', outputFolder, 'PackageName', 'mongomat', 'verbose', true);

cd gen
build(definemongomat)
cd ..

end