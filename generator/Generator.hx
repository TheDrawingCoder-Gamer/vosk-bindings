package generator;

import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
using StringTools;
class Generator {
    #if !cpp
    public static function main() {
        var kaldiFiles = recursiveReadDir("lib/kaldi/src");
        var xmlFile = "<xml>\n\t<files id='kaldi'>\n";
        for (file in kaldiFiles) {
            if (Path.extension(file) != "h" && Path.extension(file) != "hpp") 
                continue;
            // Remove the prefix
            // var fileName = file.replace("lib/kaldi/src/", "");
            xmlFile+= "\t\t<depend name='${haxelib:vosk-bindings}/" + file + "'/>\n";
        }
        xmlFile += "\t</files>\n";
        xmlFile += "\t<files id='vosk'>\n";
        var voskFiles = recursiveReadDir("lib/vosk-api/src");
        for (file in voskFiles) {
            if (Path.extension(file) != "hpp" && Path.extension(file) != "h") 
                continue;
            // Remove the prefix
            // var fileName = file.replace("lib/vosk-api/src/", "");
            xmlFile+= "\t\t<depend name='${haxelib:vosk-bindings}/" + file + "'/>\n";
        }
        xmlFile += "\t</files>";
        xmlFile += "\n</xml>";
        File.saveContent("files.xml", xmlFile);
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