package vosk;

import cpp.Pointer;
import cpp.ConstPointer;
import cpp.Char;
import cpp.Int8 as Short;

@:keep
@:include('../lib/vosk-api/src/kaldi_recognizer.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('kaldi_recognizer'))
#end
class KaldiRecognizer {
    @:native("KaldiRecognizer::KaldiRecognizer")
    overload function new(model:Pointer<Model>, sampleFrequency:Float):Void;
    @:native("KaldiRecognizer::KaldiRecognizer")
    overload function new(model:Pointer<Model>, sampleFrequency:Float, spm_model:Pointer<SpkModel>):Void;
    @:native("KaldiRecognizer::KaldiRecognizer")
    overload function new(model:Pointer<Model>, sampleFrequency:Float, grammar:ConstPointer<Char>):Void;
    @:native("KaldiRecognizer::~KaldiRecognizer")
    overload function new():Void;
    @:native("KaldiRecognizer::SetMaxAlternatives")
    function setMaxAlternatives(maxAlternatives:Int):Void;
    @:native("KaldiRecognizer::SetSpkModel")
    function setSpkModel(spkModel:Pointer<SpkModel>):Void;
    @:native("KaldiRecognizer::SetWords")
    function setWords(words:Bool):Void;
    @:native("KaldiRecognizer::AcceptWaveform")
    overload function acceptWaveform(data:ConstPointer<Char>, length:Int):Bool;
    @:native("KaldiRecognizer::AcceptWaveform")
    overload function acceptWaveform(sdata:ConstPointer<Short>, length:Int):Bool;
    @:native("KaldiRecognizer::AcceptWaveform")
    overload function acceptWaveform(fdata:ConstPointer<Float>, length:Int):Bool;
    @:native("KaldiRecognizer::Result")
    function result():ConstPointer<Char>;
    @:native("KaldiRecognizer::FinalResult")
    function finalResult():ConstPointer<Char>;
    @:native("KaldiRecognizer::PartialResult")
    function partialResult():ConstPointer<Char>;
    @:native("KaldiRecognizer::Reset")
    function reset():Void;
}