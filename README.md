# Bridging neuronal correlations and dimensionality reduction
Code for computing pairwise metrics (Rsc mean and Rsc s.d.) and population metrics (loading similarity, % shared variance, and dimensionality).

For more details on these metrics see our paper, "Bridging neuronal correlations and dimensionality reduction". Umakantha, Morina, Cowley et al. (Neuron, 2021).

"compute_pair_metrics.m" computes pairwise metrics. "compute_pop_metrics.m" fits factor analysis (using crossvalidaiton to select a dimensionality) and then computes population metrics, as well as the shared eigenspectrum. For more information on using and fitting factor analysis models, see the factor analysis README (located at "helpers/factor_analysis/README").

Checkout and run "example.m" to see how to use the code pack. The script computes pairwise and population metrics for a population of V4 neurons, and compares metrics between two experimental conditions: 'attend-in' and 'attend-out'. For more results and experimental details, see Umakantha, Morina, Cowley et al. (Neuron, 2021).