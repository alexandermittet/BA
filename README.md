# Bachelors Thesis
Author: Alexander Mittet

# Foundational Model for Endoscopy

### Lifting classification accuracy of Ulcerative Colitis mayo endoscopic subscore, using self-supervised pre-training on images with Vision Transformers

Date of submission: 10/06-2024

Advisor: Bulat Ibragimov

Co-advisor: Bjørn Leth Møller

## Abstract: 

Ulcerative Colitis (UC) is a chronic inflammatory bowel disease that
significantly impacts quality of life. Endoscopy is the modern stan-
dard for diagnosing and monitoring UC using the Mayo Endoscopic
Subscore (MES). However, there is high inter-observer variability
among doctors in assessing the MES score. This thesis explores us-
ing self-supervised pre-training with Vision Transformers and Masked
Autoencoders (MAE) on unlabelled endoscopy images to improve ac-
curacy of an MES classification model. A baseline achieved an F1-
score 54 on the supervised dataset. An MAE model was then pre-
trained on a large unlabelled dataset of 370,000 endoscopy images.
The pre-trained model achieved an F1-score of 61-71, depending on
hyperparameters. We found a top-1 improvement of 16 ± 0.35 points
and an average improvement of 12 ± 3.2 points compared to the base-
line, excluding one result lower than baseline. The pre-trained models
reduced confusion between the middle MES classes compared to the
baseline. Analysis showed the model’s mean squared error loss could
potentially identify low quality images for removal. Embedding vi-
sualization with t-SNE did not reveal clear clustering by MES score.
Dimensionality reduction with PCA suggested the model size could
be reduced while retaining most variance. The results demonstrate
that self-supervised pre-training with MAE can improve MES classi-
fication accuracy and efficiency by leveraging unlabelled data. Future
directions include exploring alternative pre-training methods, refining
the masking strategy, and accounting better for class imbalance.

## TL;DR results:
We do two things: 1) Predict MES-Score directly and 2) Pretrain a model to first recreate the images from masked input, and then fine tune this model to finally predict the MES-score. 
TL;DR IT WORKS!
![Skærmbillede 2025-04-08 kl  16 27 50](https://github.com/user-attachments/assets/6d66dc3c-440d-4006-9d7a-a023befe1f76)

## Tables: Predicting MES-Score (mayo endoscopic subscore) 
Baseline model predicting MES-Score directly vs our method (MAE pre-training) vs fine-tuned timm (torch image models)

![tables](https://github.com/user-attachments/assets/3925a43a-09ee-4a8a-9cb0-ab899cafb0f1)
Our method lifts MES-score prediction F1-score by 17%-points. Timm fine-tuning lifts by 30%-points.


## Model recreates images a lot better than average pixel value
First we see the 5 images our model recreates the best, fillowed by the 5 we recreate the worst.
We measure using SSIM score, which is based on human perception. To the middle left we see histogram of SSIM-recreation scores of our model on test set.
To the right we see examples images, where: 
Left is masked input to our model, middle is our MAE-pre-trained model's recreation of the whole images, and right is ground truth/label/original image.
![ssim w examples](https://github.com/user-attachments/assets/e3c302ef-908b-4180-8441-71f2b1bb69a6)


## We do not see seperate clusters in model latent space as hoped
![no clustering](https://github.com/user-attachments/assets/c65264f5-7414-4341-91a4-7ca6c36abb43)
Class 4 (yellow) is the class is used for "bad/unusable images". These could be where the camera is pressed against skin and is not looking at anything that can be used for diagnosing.


## Model recreates "no signal" images from hospital camera
![Skærmbillede 2025-04-08 kl  16 47 11](https://github.com/user-attachments/assets/ab9cfed7-67a1-4965-916b-650713fa9064)


## Conclusion:
In this study, we demonstrated that pre-training using the MAE method improves our models
classification performance. Top-1 comparison shows model F1-score improvement of 16±0.35
points compared to the baseline. Average comparison, excluding the result of Adam optimizer
that was lower than baseline, shows an F1-score of 66 ± 2.9, which is 12 ± 3.2 points higher
than the baseline’s 54±3.6. However, our method still lags behind state-of-the-art pre-trained
models like those from the timm library. We found that the loss could potentially be used
to identify and remove low quality images from the dataset. SSIM scores of our pretrained
model, suggests that it is reconstructing images better than average blur. Furthermore,
the t-SNE visualization of feature embeddings did not show clear clustering of MES-score
representions in the model. The PCA analysis suggested that the model size could be reduced
while retaining most of the variance in the feature embeddings. The results demonstrate that
self-supervised pre-training with MAE on unlabelled data, can improve MES classification
accuracy and reduce amount of labelled data needed.

## Future Work
In future studies we would like to compare our MAE to other pre-training methods, such as
Masked Siamese Networks, to see if they learn the task better with the same data. Next we
would use MSE loss to filter out bad images and run the experiments again. After that, we
would like to have enough compute (computational power) to do a proper sweep/grid search
o find the optimal hyperparameters for our method, instead of choosing what configurations
are most likeely to give best results. This way we check all possibilities.
It would also be interesting to see how modifications to MAE similar to the ones in Prior
Matching for Siamese Networks (PMSN) proposed by Assran, Balestriero, et al., 2022 could
account for class imbalance.
As discussed in Balestriero et al., 2024, the masking strategy for an MAE matters a lot.
Tailoring the right masking method could be the decisive factor in achieving performance
gains.
