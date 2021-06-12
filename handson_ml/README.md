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
<li><a href="#end-to-end-machine-learning-project"><span class="toc-section-number">2</span> End-to-End Machine Learning Project</a></li>
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
<h1 data-number="2" id="end-to-end-machine-learning-project"><span class="header-section-number">2</span> End-to-End Machine Learning Project</h1>
</body>
</html>
