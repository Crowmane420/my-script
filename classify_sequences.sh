qiime feature-classifier classify-sklearn \
  --i-reads your_sequences.qza \
  --i-classifier ncbi_16s_classifier.qza \
  --o-classification your_taxonomy_results.qza

