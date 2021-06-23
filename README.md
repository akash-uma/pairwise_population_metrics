# Bridging neuronal correlations and dimensionality reduction
Code for computing pairwise metrics (Rsc mean and Rsc s.d.) and population metrics (loading similarity, % shared variance, and dimensionality).

For more details on these metrics see our paper, "Bridging neuronal correlations and dimensionality reduction". Umakantha, Morina, Cowley et al. (Neuron, 2021).

"compute_pair_metrics.m" computes pairwise metrics. 

"compute_pop_metrics.m" fits factor analysis (using crossvalidation to select a dimensionality) and then computes population metrics, as well as the shared eigenspectrum. For more information on using and fitting factor analysis models, see the factor analysis README (located at "helpers/factor_analysis/README").

Checkout and run "example.m" to see how to use the code pack. The script computes pairwise and population metrics for a population of V4 neurons, and compares metrics between two experimental conditions: 'attend-in' and 'attend-out'. 

For more results and experimental details, see Umakantha, Morina, Cowley et al. (Neuron, 2021).

Tips/recommendations:
1) Both pairwise and population metrics can be tricky to interpret on their own. We recommend comparing them in a relative manner (e.g., between two experimental conditions collected in the same session).
2) Pairwise and population metrics can depend on 1) the number of trials and 2) the number of neurons. If possible, we recommend using the same neurons and equalizing the number of trials between the experimental conditions that one is comparing.
3) Estimation of population metrics can be tricky when data is limited. When fitting factor analysis, we recommend having at least 3x (preferably 5x or more) the number of trials as the number of neurons.


We would like to thank Richard Johnston, Patricia Stan, and Shenghao Wu for their help in testing the code.
