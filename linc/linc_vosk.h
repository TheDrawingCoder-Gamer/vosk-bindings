#pragma once

#ifndef HXCPP_h
#include <hxcpp.h>
#endif 
#include "../lib/vosk-api/src/vosk_api.h"

namespace linc {
    namespace vosk {
        extern VoskModel *vosk_model_new(::String model_path);

        extern void vosk_model_free(VoskModel *model);

        extern int vosk_model_find_word(VoskModel *model, ::String word);

        extern VoskSpkModel *vosk_spk_model_new(::String model_path);

        extern void vosk_spk_model_free(VoskSpkModel *model);

        extern VoskRecognizer *vosk_recognizer_new(VoskModel *model, float sample_rate);

        extern VoskRecognizer *vosk_recognizer_new_spk(VoskModel *model, float sample_rate, VoskSpkModel *spk_model);

        extern VoskRecognizer *vosk_recognizer_new_grm(VoskModel *model, float sample_rate, const char *grammar);

        extern void vosk_recognizer_set_spk_model(VoskRecognizer *recognizer, VoskSpkModel *spk_model);

        extern void vosk_recognizer_set_max_alternatives(VoskRecognizer *recognizer, int max_alternatives);

        extern void vosk_recognizer_set_words(VoskRecognizer *recognizer, int words);

        extern int vosk_recognizer_accept_waveform(VoskRecognizer *recognizer, const char *data, int length);

        extern int vosk_recognizer_accept_waveform_s(VoskRecognizer *recognizer, const short *data, int length);

        extern int vosk_recognizer_accept_waveform_f(VoskRecognizer *recognizer, const float *data, int length);

        extern ::String vosk_recognizer_result(VoskRecognizer *recognizer);

        extern ::String vosk_recognizer_partial_result(VoskRecognizer *recognizer);

        extern ::String vosk_recognizer_final_result(VoskRecognizer *recognizer);

        extern void vosk_recognizer_reset(VoskRecognizer *recognizer);

        extern void vosk_recognizer_free(VoskRecognizer *recognizer);

        extern void vosk_set_log_level(int log_level);

        extern void vosk_gpu_init();

        extern void vosk_gpu_thread_init();
    }
    
}
