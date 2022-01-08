package;

import cpp.Pointer;
import cpp.RawConstPointer;
import cpp.ConstPointer;
import vosk.Vosk;

class Test {
    static var recognizer:vosk.Vosk.Recognizer;
    static var model:vosk.Vosk.Model;
    public static function main() {
        
        model = Vosk.newModel("assets/model");
        //recognizer = Vosk.newRecognizer(model, cast (6000, cpp.Float32));
        var audioInterface = new grig.audio.AudioInterface();
        var ports = audioInterface.getPorts();
        var options:grig.audio.AudioInterfaceOptions = {};
        if (ports.length < 1) {
            trace('No ports found');
            return;
        }

        for (port in ports) {
            if (port.isDefaultInput) {
                options.inputNumChannels = port.maxInputChannels;
                options.inputPort = port.portID;
                options.sampleRate = port.defaultSampleRate;
                options.inputLatency = port.defaultLowInputLatency;
            }
        }
        trace(options);
        recognizer = Vosk.newRecognizer(model, cast (options.sampleRate, cpp.Float32));
        // recognizer.setMaxAlternatives(0);
        // recognizer.setWords(1);
        audioInterface.setCallback(audioCallback);
        audioInterface.openPort(options).handle(function (audioOutcome) {
            switch audioOutcome {
                case Success(data):
                    mainLoop(data);
                case Failure(failure):
                    trace(failure);
                    Sys.exit(1);
                    
            }
        });
        
        
    }
    static function mainLoop(audioInterface:grig.audio.AudioInterface) {
        while (true) {
            if (Sys.getChar(false) == 4) {
                audioInterface.closePort();
                return;
            }
        }
        
    }
    static function audioCallback(input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer, sampleRate:Float, streamInfo:grig.audio.AudioStreamInfo) {
        var channel:haxe.ds.Vector<cpp.Float32> = cast input.channels[0];

        // Cast Type params must be dynamic.... cursed
        var channelAsArray:Array<cpp.Float32> = channel.toArray();
        var pointer:cpp.Pointer<cpp.Float32> = cpp.Pointer.ofArray(channelAsArray);
        // if final
        // trace('hello');
        var isFinal = recognizer.acceptWaveformF(pointer.constRaw, channel.length);
        if (isFinal != 0) {
            trace(isFinal);
            Sys.println(recognizer.result());
        }  else {
            // Sys.println(recognizer.partialResult());
        }

       
    }
    
}