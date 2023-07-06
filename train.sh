CUDA_VISIBLE_DEVICES=0,1,2,3 deepspeed --num_gpus=4 fastchat/train/train_lora.py \
    --ddp_timeout=360000 \
    --output_dir "saved/flacuna/" \
    --deepspeed "deepspeed_configs/bf16.json" --bf16 True \
    --lora_r 8 --lora_alpha 16 --lora_dropout 0.05 \
    --model_name_or_path "TheBloke/vicuna-13B-1.1-HF" \
    --data_path "data/flan_mini.json" \
    --per_device_train_batch_size 2 --per_device_eval_batch_size 2 --gradient_accumulation_steps 16 \
    --num_train_epochs 1 --evaluation_strategy "epoch" \
    --save_strategy "steps" --save_steps 1000 --save_total_limit 20 \
    --learning_rate 2e-5 --weight_decay 0. --warmup_ratio 0.0001 --lr_scheduler_type "cosine" --logging_steps 500 \
    --model_max_length 1280 \
    --gradient_checkpointing True --lazy_preprocess True