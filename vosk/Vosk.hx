package vosk;

import cpp.ConstPointer;
import cpp.Char;
import cpp.Pointer;
import cpp.Int32;
@:keep
@:include('../lib/vosk-api/src/vosk_api.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('vosk'))
#end
extern class Vosk {
    @:native("vosk_model_new")
    // TODO: What the hell is a VoskModel
    // I have a Model, but no VoskModel
    static function newModel(modelPath:ConstPointer<Char>):Pointer<Model>;
    @:native("vosk_model_free")
    static function freeModel(model:Pointer<Model>):Void;
    @:native("vosk_model_find_word")
    static function findWord(model:Pointer<Model>, word:ConstPointer<Char>):Int32;
    @:native("vosk_spk_model_new")
    static function newSpkModel(modelPath:ConstPointer<Char>):Pointer<SpkModel>;
    @:native("vosk_spk_model_free")
    static function freeSpkModel(model:Pointer<SpkModel>):Void;
    @:native("vosk_recognizer_new")
    static function newRecognizer(model:Pointer<Model>, sampleRate:Float):Pointer<KaldiRecognizer>;
    @:native("vosk_recognizer_new_spk")
    static function newSpkRecognizer(model:Pointer<Model>, sampleRate:Float, spkModel:Pointer<SpkModel>):Pointer<KaldiRecognizer>;
    @:native("vosk_recognizer_new_grm")
    static function newGrmRecognizer(model:Pointer<Model>, sampleRate:Float, grammar:ConstPointer<Char>):Pointer<KaldiRecognizer>;
    @:native("vosk_recognizer_set_spk_model")
    static function setSpkModel(recognizer:Pointer<KaldiRecognizer>, spkModel:Pointer<SpkModel>):Void;
    @:native("vosk_recognizer_set_max_alternatives")
    static function setMaxAlternatives(recognizer:Pointer<KaldiRecognizer>, maxAlternatives:Int32):Void;
    @:native("vosk_recognizer_set_words")
    static function setWords(recognizer:Pointer<KaldiRecognizer>, words:Int32):Void;
    @:native("vosk_recognizer_accept_waveform")
    static function acceptWaveform(recognizer:Pointer<KaldiRecognizer>, waveform:Pointer<Float>, length:Int32):Void;
} //Vosk