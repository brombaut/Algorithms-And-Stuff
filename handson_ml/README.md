<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
<head>
</head>
<body>
<header id="title-block-header">
<h1 class="title">Machine Learning Topics</h1>
</header>
<nav id="TOC" role="doc-toc">
<ul>
<li><a href="#the-machine-learning-landscape"><span class="toc-section-number">1</span> The Machine Learning Landscape</a>
<ul>
<li><a href="#types-of-machine-learning-systems"><span class="toc-section-number">1.1</span> Types of Machine Learning Systems</a>
<ul>
<li><a href="#supervised-vs-unsupervised"><span class="toc-section-number">1.1.1</span> Supervised vs Unsupervised</a></li>
<li><a href="#batch-and-online-learning"><span class="toc-section-number">1.1.2</span> Batch and Online Learning</a></li>
<li><a href="#instance-based-vs.-model-based-learning"><span class="toc-section-number">1.1.3</span> Instance-Based vs. Model-Based learning</a></li>
</ul></li>
<li><a href="#main-challenges-of-machine-learning"><span class="toc-section-number">1.2</span> Main Challenges of Machine Learning</a></li>
<li><a href="#testing-and-validation"><span class="toc-section-number">1.3</span> Testing and Validation</a>
<ul>
<li><a href="#hyperparameter-tuning-and-model-selection"><span class="toc-section-number">1.3.1</span> Hyperparameter Tuning and Model Selection</a></li>
<li><a href="#data-mismatch"><span class="toc-section-number">1.3.2</span> Data Mismatch</a></li>
</ul></li>
<li><a href="#exercises"><span class="toc-section-number">1.4</span> Exercises</a></li>
</ul></li>
<li><a href="#end-to-end-machine-learning-project-35"><span class="toc-section-number">2</span> End-to-End Machine Learning Project [35]</a>
<ul>
<li><a href="#look-at-the-big-picture-37"><span class="toc-section-number">2.1</span> Look at the Big Picture [37]</a></li>
<li><a href="#get-the-data-42"><span class="toc-section-number">2.2</span> Get the Data [42]</a></li>
<li><a href="#discover-and-visualize-the-data-to-gain-insights-56"><span class="toc-section-number">2.3</span> Discover and visualize the data to gain insights [56]</a></li>
<li><a href="#prepare-the-data-for-machine-learning-algorithms-62"><span class="toc-section-number">2.4</span> Prepare the data for Machine Learning algorithms [62]</a></li>
<li><a href="#scikit-learn-design-64"><span class="toc-section-number">2.5</span> Scikit-Learn Design [64]</a>
<ul>
<li><a href="#consistency"><span class="toc-section-number">2.5.1</span> Consistency</a></li>
<li><a href="#inspection"><span class="toc-section-number">2.5.2</span> Inspection</a></li>
<li><a href="#non-proliferation-of-classes"><span class="toc-section-number">2.5.3</span> Non-proliferation of classes</a></li>
<li><a href="#composition"><span class="toc-section-number">2.5.4</span> Composition</a></li>
<li><a href="#sensible-defaults"><span class="toc-section-number">2.5.5</span> Sensible defaults</a></li>
</ul></li>
<li><a href="#select-and-train-a-model-72"><span class="toc-section-number">2.6</span> Select and Train a Model [72]</a></li>
<li><a href="#fine-tune-your-model-75"><span class="toc-section-number">2.7</span> Fine-tune your model [75]</a></li>
<li><a href="#launch-monitor-and-maintain-your-system-80"><span class="toc-section-number">2.8</span> Launch, monitor, and maintain your system [80]</a></li>
<li><a href="#exercises-84"><span class="toc-section-number">2.9</span> Exercises [84]</a></li>
</ul></li>
</ul>
</nav>
<h1 data-number="1" id="the-machine-learning-landscape"><span class="header-section-number">1</span> The Machine Learning Landscape</h1>
<h2 data-number="1.1" id="types-of-machine-learning-systems"><span class="header-section-number">1.1</span> Types of Machine Learning Systems</h2>
<h3 data-number="1.1.1" id="supervised-vs-unsupervised"><span class="header-section-number">1.1.1</span> Supervised vs Unsupervised</h3>
<ul>
<li><p><strong>Supervised Learning</strong><br />
The training set you feed to the algorithm includes the desired solutions, called <em>labels</em>.</p></li>
<li><p><strong>Unsupervised Learning</strong><br />
The training set is unlabeled. The system tries to learn without a teacher</p></li>
<li><p><strong>Semi-supervised Learning</strong><br />
The algorithms can deal with data that’s partially labeled. Most of these types of algorithms are combinations of unsupervised and supervised algorithms</p></li>
<li><p><strong>Reinforcement Learning<br />
</strong>The learning system (<em>agent</em>) can observe the environment, select and perform actions, and get <em>rewards</em> or <em>penalties</em> in return. It must then learn by itself what is the best strategy, called a <em>policy</em>, to get the most reward over time. A policy defines what action the agent should choose when it is in a given situation.</p></li>
</ul>
<h3 data-number="1.1.2" id="batch-and-online-learning"><span class="header-section-number">1.1.2</span> Batch and Online Learning</h3>
<ul>
<li><p><strong>Batch Learning</strong><br />
The system is incapable of learning incrementally: it must be trained using all the available data, usually done offline, and then once the model is trained, it is then launched into production and runs without learning anymore (<em>offline learning</em>)</p></li>
<li><p><strong>Online Learning</strong><br />
You train the system incrementally by feeding it data instances sequentially, either individually or in small groups called <em>mini batches</em>. Each learning step is fast and cheap, so the system can learn about new data on the fly, as it arrives.</p>
<ul>
<li><p>Great for systems that receive data as a continuous flow (e.g., stock prices) and need to adapt to change rapidly or autonomously.</p></li>
<li><p>Also good with limited computing resources: once an online learning system has learned about new data instances, it does not need them anymore and you can discard them.</p></li>
<li><p>Online learning algorithms can be used to train systems on huge datasets that cannot fit in one machine’s main memory (<em>out-of-core learning</em>).</p></li>
<li><p>One important parameter of online learning systems is how fast they should adapt to changing data (<em>learning rate</em>)</p></li>
<li><p>If bad data is fed to the system, the system’s performance will gradually decline.</p></li>
</ul></li>
</ul>
<h3 data-number="1.1.3" id="instance-based-vs.-model-based-learning"><span class="header-section-number">1.1.3</span> Instance-Based vs. Model-Based learning</h3>
<p>How do machine learning systems <em>generalize</em>?</p>
<ul>
<li><p><strong>Instance-based learning</strong><br />
The system learns the examples by heart, then generalizes to new cases by using a similarity measure to compare them to the learned examples (or a subset).</p></li>
<li><p><strong>Model-based learning<br />
</strong>Build a model of these examples and then use that model to make <em>predictions</em>.</p>
<ul>
<li><p>The model takes parameters.</p></li>
<li><p>To determine how you can know which values make your model perform best, you need to specify a performance measure.</p>
<ul>
<li><p><em>Utility/fitness function</em> measures how good your model is.</p></li>
<li><p><em>Cost function</em> that measures how bad it is.</p></li>
</ul></li>
</ul></li>
</ul>
<h2 data-number="1.2" id="main-challenges-of-machine-learning"><span class="header-section-number">1.2</span> Main Challenges of Machine Learning</h2>
<ul>
<li><p>Insufficient Quantity of Training Data</p></li>
<li><p>Nonrepresentative Training Data</p></li>
<li><p>Poor Quality Data</p></li>
<li><p>Irrelevant Features</p></li>
<li><p>Overfitting</p></li>
<li><p>Underfitting</p></li>
</ul>
<h2 data-number="1.3" id="testing-and-validation"><span class="header-section-number">1.3</span> Testing and Validation</h2>
<p>Split data into two sets: <em>training</em> and <em>test</em> sets. The error rate on new cases is called the <em>generalization error</em> (or <em>out-of-sample error</em>), and by evaluating your model on the test set, you get an estimate of this error. This value tells you how well your model will perform on instances it has never seen before.</p>
<h3 data-number="1.3.1" id="hyperparameter-tuning-and-model-selection"><span class="header-section-number">1.3.1</span> Hyperparameter Tuning and Model Selection</h3>
<p><strong>Situation</strong><br />
You want to compare models, so you train both and compare how well they generalize using the test set. Then you apply some regularization to avoid overfitting. To pick the regularization hyperparameter, you train 100 different models with different values. You pick the model with the lowest generalization error, and deploy to production, but the error in production is much higher.</p>
<p><strong>Problem</strong><br />
You measured the generalization error multiple times on the test set, and you adapted the model and hyperparameters to produce the best model for that particular set, which means the model is unlikely to perform well on new data.</p>
<p>Solutions</p>
<ul>
<li><p>Holdout validation – You simply hold out part of the training set to evaluate several candidate models and select the best one. The new held-out set is called the <em>validation set</em> (or sometimes the <em>development set</em>). You train multiple models on the reduced training set and select the model that performs best on the validation set. After this holdout validation process, you train the best model on the full training set (including the validation set), and this gives you the final model. Lastly, you evaluate this final model on the test set to get an estimate of the generalization error.</p>
<ul>
<li><p><em>Cross validation</em> – Use many small validation sets. Each model is evaluated once per validation set after it is trained on the rest of the data. By averaging out all the evaluations of a model, you get a much more accurate measure of its performance.</p></li>
</ul></li>
</ul>
<h3 data-number="1.3.2" id="data-mismatch"><span class="header-section-number">1.3.2</span> Data Mismatch</h3>
<p>Training data might not be representative of the data that will be used in production.</p>
<h2 data-number="1.4" id="exercises"><span class="header-section-number">1.4</span> Exercises</h2>
<ul>
<li><p><em><u>What is a test set, and why would you want to use it?</u></em><br />
A test set is used to estimate the generalization error that a model will make on new instances, before the model is launched in production.</p></li>
<li><p><em><u>What is the purpose of a validation set?</u></em><br />
A validation set is used to compare models. It makes it possible to select the best model and tune the hyperparameters.</p></li>
<li><p><em><u>What is the train-dev set, when do you need it, and how do you use it?<br />
</u></em>The train-dev set is used when there is a risk of mismatch between the training data and the data used in the validation and test datasets (which should always be as close as possible to the data used once the model is in production). The train-dev set is a part of the training set that’s held out (the model is not trained on it). The model is trained on the rest of the training set, and evaluated on both the train-dev set and the validation set. If the model performs well on the training set but not on the train-dev set, then the model is likely overfitting the training set. If it performs well on both the training set and the train-dev set, but not on the validation set, then there is probably a significant data mismatch between the training data and the validation + test data, and you should try to improve the training data to make it look more like the validation + test data.</p></li>
<li><p><em><u>What can go wrong if you tune hyperparameters using the test set?</u></em><br />
If you tune hyperparameters using the test set, you risk overfitting the test set, and the generalization error you measure will be optimistic (you may launch a model that performs worse than you expect).</p></li>
</ul>
<h1 data-number="2" id="end-to-end-machine-learning-project-35"><span class="header-section-number">2</span> End-to-End Machine Learning Project [35]</h1>
<h2 data-number="2.1" id="look-at-the-big-picture-37"><span class="header-section-number">2.1</span> Look at the Big Picture [37]</h2>
<ul>
<li><p>Frame the Problem – The first question to ask your boss is what exactly the busines object is.</p>
<ul>
<li><p>Data pipeline – A sequence of data processing components.</p></li>
<li><p>Should also ask what the current solution is.</p></li>
</ul></li>
<li><p>Select a Performance Measure</p>
<ul>
<li><p>Root Mean Square Error (RMSE)</p>
<ul>
<li><p>Corresponds to the Euclidean norm – the notion of distance you are familiar with.</p></li>
<li><p>Also called the <em>l<sub>2</sub> norm</em>.</p></li>
</ul></li>
<li><p>Mean Absolute Error (MAE)</p>
<ul>
<li><p>Sometimes called the Manhattan norm because it measures the distance between two points in a city if you can only travel along orthogonal city blocks.</p></li>
<li><p>Also called the <em>l<sub>1</sub> norm</em>.</p></li>
</ul></li>
<li><p>The higher the norm index, the more it focuses on large values and neglects small ones.</p></li>
</ul></li>
<li><p>Check the assumptions</p>
<ul>
<li><p>List and verify the assumptions.</p></li>
</ul></li>
</ul>
<h2 data-number="2.2" id="get-the-data-42"><span class="header-section-number">2.2</span> Get the Data [42]</h2>
<ul>
<li><p>Create the Workspace</p>
<ul>
<li><p>Create an Isolated Environment</p></li>
</ul></li>
<li><p>Download the data</p></li>
<li><p>Take a quick look at the data structures</p>
<ul>
<li><p>.info()</p></li>
<li><p>.value_counts()</p></li>
<li><p>.describe()</p>
<ul>
<li><p><em>Standard deviation</em> – the square root of the <em>variance</em>, which is the average of the squared deviation from the mean. When a feature has a bell-shaped <em>normal distribution</em> (<em>Gaussian distribution</em>), which is very common, the “68-95-99.7” rule applies: about 68% of the values fall within 1std of the mean, 95% within 2std, and 99.7% within 3std.</p></li>
<li><p>Percentiles</p></li>
<li><p>Quartiles</p></li>
</ul></li>
<li><p>.hist()</p></li>
</ul></li>
<li><p>Create a Test Set</p>
<ul>
<li><p>Protect from <em>data snooping bias</em></p></li>
<li><p>.train_test_split()</p></li>
<li><p>np.random.seed(42)</p></li>
<li><p>.cut()</p>
<ul>
<li><p>Bin numerical attribute into categories</p></li>
</ul></li>
<li><p>StratifiedShuffleSplit</p></li>
</ul></li>
</ul>
<h2 data-number="2.3" id="discover-and-visualize-the-data-to-gain-insights-56"><span class="header-section-number">2.3</span> Discover and visualize the data to gain insights [56]</h2>
<ul>
<li><p>Looking for correlations</p>
<ul>
<li><p>.corr()</p>
<ul>
<li><p>Computes <em>standard correlation coefficient</em> (<em>Pearson’s r</em>)</p></li>
<li><p>Only measures linear correlations.</p></li>
</ul></li>
<li><p>.scatter_matrix()</p>
<ul>
<li><p>Plots every numerical attribute against every other numerical attribute.</p></li>
</ul></li>
</ul></li>
<li><p>Experimenting with Attribute Combinations</p>
<ul>
<li><p>Computing logs, exponents, combining attributes to make new ones</p></li>
</ul></li>
</ul>
<h2 data-number="2.4" id="prepare-the-data-for-machine-learning-algorithms-62"><span class="header-section-number">2.4</span> Prepare the data for Machine Learning algorithms [62]</h2>
<ul>
<li><p>Data Cleaning</p>
<ul>
<li><p>Handle missing values</p>
<ul>
<li><p>SimpleImputer</p></li>
</ul></li>
</ul></li>
<li><p>Handling Text and Categorical Attributes</p>
<ul>
<li><p>OneHotEncoder()</p></li>
</ul></li>
<li><p>Feature Scaling</p>
<ul>
<li><p>Min-max scaling (normalization)</p>
<ul>
<li><p>Values are shifted and rescaled so that they end up ranging from 0 to 1.</p></li>
<li><p><em>MinMaxScaler</em></p></li>
</ul></li>
<li><p>Standardization</p>
<ul>
<li><p>Subtract the mean, and then divide by the standard deviation</p></li>
<li><p><em>StandardScaler</em></p></li>
</ul></li>
</ul></li>
<li><p>Transformation Pipelines</p>
<ul>
<li><p><em>Pipeline</em></p></li>
<li><p><em>ColumnTranformer</em></p></li>
</ul></li>
</ul>
<h2 data-number="2.5" id="scikit-learn-design-64"><span class="header-section-number">2.5</span> Scikit-Learn Design [64]</h2>
<h3 data-number="2.5.1" id="consistency"><span class="header-section-number">2.5.1</span> Consistency</h3>
<p>All objects share a consistent and simple interface</p>
<h4 data-number="2.5.1.1" id="estimators"><span class="header-section-number">2.5.1.1</span> Estimators</h4>
<p>Any object that can estimate some parameters based on a dataset is called an <em>estimator</em> (e.g., an <em>imputer</em> is an estimator). The estimation itself is performed by the <em>.fit()</em> method, and it takes only a dataset as a parameter (or two for supervised learning algorithms; the second dataset contains the labels). Any other parameters needed to guide the estimation process is considered a hyperparameter (such as an <em>imputer’s strategy</em>), and it must be set as an instance variable (generally via a constructor parameter).</p>
<h4 data-number="2.5.1.2" id="transformers"><span class="header-section-number">2.5.1.2</span> Transformers</h4>
<p>Some estimators (such as an <em>imputer</em>) can also transform a dataset; these are called <em>transformers</em>. Once again, the API is simple: the transformation is performed by the <em>.transform()</em> method with the dataset to transform as a parameter. It returns the transformed dataset. This transformation generally relies on the learned parameters, as is the case for an <em>imputer</em>. All transformers also have a convenience method called <em>.fit_tranform()</em> that is equivalent to calling <em>.fit()</em> and then <em>.transform()</em> (but sometimes <em>.fit_transform()</em> is optimized and runs much faster).</p>
<h4 data-number="2.5.1.3" id="predictors"><span class="header-section-number">2.5.1.3</span> Predictors</h4>
<p>Finally, some estimators, given a dataset, are capable of making predictions; they are called predictors. For example, the <em>LinearRegression</em> model is a predictor. A predictor has a <em>.predict()</em> method that takes a dataset of new instances and returns a dataset of corresponding predictions. It also has a <em>.score()</em> method that measures the quality of the predictions, given a test set (and the corresponding labels, for supervised learning algorithms). Some predictors also provide methods to measure the confidence of their predictions.</p>
<h3 data-number="2.5.2" id="inspection"><span class="header-section-number">2.5.2</span> Inspection</h3>
<p>All the estimator’s hyperparameters are accessible directly via public instance variables (e.g., <em>imputer.strategy</em>), and all the estimator’s learned parameters are accessible via public instance variables with an underscore suffix (e.g., <em>imputer.statistics_</em>).</p>
<h3 data-number="2.5.3" id="non-proliferation-of-classes"><span class="header-section-number">2.5.3</span> Non-proliferation of classes</h3>
<p>Datasets are represented as NumPy arrays or SciPy sparse matrices, instead of homemade classes. Hyperparameters are just regular Python strings or numbers.</p>
<h3 data-number="2.5.4" id="composition"><span class="header-section-number">2.5.4</span> Composition</h3>
<p>Existing building blocks are reused as much as possible. For example, it is easy to create a Pipeline estimator from an arbitrary sequence of transformers followed by a final estimator.</p>
<h3 data-number="2.5.5" id="sensible-defaults"><span class="header-section-number">2.5.5</span> Sensible defaults</h3>
<p>Scikit-Learn provides reasonable default values for most parameters, making it easy to quickly create a baseline working system.</p>
<h2 data-number="2.6" id="select-and-train-a-model-72"><span class="header-section-number">2.6</span> Select and Train a Model [72]</h2>
<ul>
<li><p>Training and Evaluating the Training Set</p>
<ul>
<li><p><em>sklearn.metrics.mean_squared_error</em></p></li>
</ul></li>
<li><p>Better Evaluation Using Cross-Validation</p>
<ul>
<li><p><em>sklearn.model_selection.cross_val_score</em></p>
<ul>
<li><p>Expects a utility function (greater is better) rather than a cost function (lower is better).</p></li>
</ul></li>
</ul></li>
<li><p>You should save every model you experiment with.</p>
<ul>
<li><p><em>pickle</em></p></li>
<li><p><em>joblib</em></p></li>
</ul></li>
</ul>
<h2 data-number="2.7" id="fine-tune-your-model-75"><span class="header-section-number">2.7</span> Fine-tune your model [75]</h2>
<ul>
<li><p>Grid Search</p>
<ul>
<li><p><em>sklearn.model_selection.GridSearchCV</em></p></li>
<li><p>Tell which hyperparameters to experiment with and what values to try out, and it will use cross-validation to evaluate all the possible combinations.</p></li>
<li><p>When you have no idea what value a hyperparameter should have, a simple approach is to try out consecutive powers of 10.</p></li>
<li><p><em>.best_params_</em> attribute</p></li>
<li><p><em>.best_estimator_</em> attribute</p></li>
<li><p><em>.cv_results_</em> attribute for all evaluation scores</p></li>
</ul></li>
<li><p>Randomized search</p>
<ul>
<li><p><em>sklearn.model_selection.RandomizedSearchCV</em></p></li>
</ul></li>
<li><p>Ensemble Methods</p></li>
<li><p>Analyze the Best Models and Their Errors</p>
<ul>
<li><p>E.g. <em>RandomForestRegressor</em> has <em>feature_importances_</em></p></li>
</ul></li>
<li><p>Evaluate your system on the test set</p></li>
</ul>
<h2 data-number="2.8" id="launch-monitor-and-maintain-your-system-80"><span class="header-section-number">2.8</span> Launch, monitor, and maintain your system [80]</h2>
<h2 data-number="2.9" id="exercises-84"><span class="header-section-number">2.9</span> Exercises [84]</h2>
<blockquote>
<p>In Notebook</p>
</blockquote>
</body>
</html>
