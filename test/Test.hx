package;

import vosk.Vosk;

class Test {
    // static var recognizer:vosk.Vosk.Recognizer;
    public static function main() {
        
        var model = Vosk.newModel("assets/model");
        var recognizer = Vosk.newRecognizer(model, cast (6000, cpp.Float32));
        /*
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
        recognizer = Vosk.newRecognizer(model, cast (options.sampleRate, cpp.Float32));
        audioInterface.setCallback(audioCallback);
        audioInterface.openPort(options).handle(function (audioOutcome) {
            switch audioOutcome {
                case Success(data):

                case Failure(failure):
                    trace(failure);
                    return;
            }
        });
        */
    }
    static function audioCallback(input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer, sampleRate:Float, streamInfo:grig.audio.AudioStreamInfo) {
        var channel = input.channels[0];
        // TODO: How is data read? 
        trace(channel.length);
    }
}