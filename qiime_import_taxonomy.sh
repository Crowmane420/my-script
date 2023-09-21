qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path your_taxonomy_file.txt \
  --output-path ncbi_16s_taxonomy.qza

