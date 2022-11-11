rm -rf __pycache__
rm data/cached*
python3 main.py --do_train \
                --do_eval \
                --train_batch_size=8 \
                --eval_batch_size=16 \
                --model_name_or_path=distilbert-base-german-cased \
                --num_train_epochs=3 \
                --save_steps=151