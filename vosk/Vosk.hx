package vosk;

import cpp.RawConstPointer;
import cpp.ConstCharStar;

@:keep 
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('vosk-bindings'))
#end
private extern class Vosk_linc { private inline static var LINC = 1; }
@:using(Vosk.Model)
@:native("VoskModel *")
@:include('linc_vosk.h')
extern class Model {
	@:native("linc::vosk::vosk_model_find_word")
	static function findWord(model:Model, word:String):Int;
	@:native("linc::vosk::vosk_spk_model_free")
	static function free(model:Model):Void;
}

@:using(Vosk.SpkModel)
@:native("VoskSpkModel *")
@:include('linc_vosk.h')
@:keep
extern class SpkModel {
	@:native("linc::vosk::vosk_spk_model_free")
	static function free(model:SpkModel):Void;
}

@:using(Vosk.Recognizer)
@:native("VoskRecognizer *")
@:include('linc_vosk.h')
@:keep
extern class Recognizer {
	@:native("linc::vosk::vosk_recognizer_set_spk_model")
	static function setSpkModel(recognizer:Recognizer, spk_model:SpkModel):Void;
	@:native("linc::vosk::vosk_recognizer_set_max_alternatives")
	static function setMaxAlternatives(recognizer:Recognizer, max_alternatives:Int):Void;
	@:native("linc::vosk::vosk_recognizer_set_words")
	static function setWords(recognizer:Recognizer, words:Int):Void;
	@:native("linc::vosk::vosk_recognizer_waveform")
	static function acceptWaveform(recognizer:Recognizer, data:ConstCharStar, length:Int):Int;
	@:native("linc::vosk::vosk_recognizer_waveform_s")
	static function acceptWaveformS(recognizer:Recognizer, data:RawConstPointer<cpp.Int16>, length:Int):Int;
	@:native("linc::vosk::vosk_recognizer_accept_waveform_f")
	static function acceptWaveformF(recognizer:Recognizer, data:RawConstPointer<cpp.Float32>, length:Int):Int;
	@:native("linc::vosk::vosk_recognizer_result")
	static function result(recognizer:Recognizer):String;
	@:native("linc::vosk::vosk_recognizer_partial_result")
	static function partialResult(recognizer:Recognizer):String;
	@:native("linc::vosk::vosk_recognizer_reset")
	static function reset(recognizer:Recognizer):Void;
	@:native("linc::vosk::vosk_recognizer_free")
	static function free(recognizer:Recognizer):Void;
}
// TODO Fix include
@:include('linc_vosk.h')
@:keep
extern class Vosk {
	@:native("linc::vosk::vosk_model_new")
	static function newModel(path:String):Model;
	@:native("linc::vosk::vosk_spk_model_new")
	static function newSpkModel(model_path:String):SpkModel;
	@:native("linc::vosk::vosk_recognizer_new")
	static function newRecognizer(model:Model, sample_rate:Single):Recognizer;
	@:native("linc::vosk::vosk_recognizer_new_spk")
	static function newRecognizerSpk(model:Model, sample_rate:Single, spk_model:SpkModel):Recognizer;
	@:native("linc::vosk::vosk_recognizer_new_grm")
	static function newRecognizerGrm(model:Model, sample_rate:Single, grammar:String):Recognizer;

	@:native("linc::vosk::vosk_set_log_level")
	static function setLogLevel(log_level:Int):Void;

	@:native("linc::vosk::vosk_gpu_init")
	static function initGpu():Void;
	@:native("linc::vosk::vosk_gpu_thread_init")
	static function initGpuThread():Void;
}