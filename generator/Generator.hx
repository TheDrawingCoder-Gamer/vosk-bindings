package generator;

import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
using StringTools;
class Generator {
    #if !cpp
    public static function main() {
        var kaldiFiles = recursiveReadDir("lib/kaldi/src");
        var xmlFile = "<xml>\n\t<files id='kaldi'>\n\t\t<compilerflag value='-I${BINDINGS_VOSK_PATH}/lib/kaldi/src/'/>";
        for (file in kaldiFiles) {
            if (Path.extension(file) != "cc" && Path.extension(file) != "cpp") 
                continue;
            // Remove the prefix
            var fileName = file.replace("lib/kaldi/src/", "");
            xmlFile+= "\t\t<file name='" + fileName + "'/>\n";
        }
        xmlFile += "\t</files>\n";
        xmlFile += "\t<files id='vosk'>\n\t\t<compilerflag value='-I${BINDINGS_VOSK_PATH}/lib/vosk/src/'/>\n";
        var voskFiles = recursiveReadDir("lib/vosk-api/src");
        for (file in voskFiles) {
            if (Path.extension(file) != "cc" && Path.extension(file) != "cpp") 
                continue;
            // Remove the prefix
            var fileName = file.replace("lib/vosk-api/src/", "");
            xmlFile+= "\t\t<file name='" + fileName + "'/>\n";
        }
        xmlFile += "\t</files>\n</xml>";
        File.saveContent("Build.xml", xmlFile);
    }
    static function recursiveReadDir(dir:String) {
        var files = [];
        for (file in FileSystem.readDirectory(dir)) {
            if (FileSystem.isDirectory(Path.join([dir, file]))) {
                files = files.concat(recursiveReadDir(Path.join([dir,file])));
            } else {
                files.push(Path.join([dir,file]));
            }
        }
        return files;
    }
    #end
}