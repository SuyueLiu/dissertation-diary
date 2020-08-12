# Action Detection

一般来说动作识别（action recognition）是在视频上或者连续的图像序列上来做，所以主流的做法像双流法（two stream）这样的模型，需要考虑时序信息和空间信息。由于毕设时间限制没有这么多时间去折腾这些模型了。在看完两篇论文之后，有一些想法，不做action recognition，而是做action detection或者叫action classification。

#### 方法一

一般动作识别最后的输出是一个描述性的词，例如walking，running。或者是一个动词加一个名词，washing cup，cooking food。那么我们把任务看成是如何从图片中得出这两个词。对于名词来说比较直观，目标检测得出来物体的坐标和类别。对于动词，首先需要保证图片中有手出现，关于手部的检测已经用yolo v3实现了。对于预测相应的动作，现在的想法是用一个简单的分类器，例如例如用在CIFAR10上那样的小网络，有手周围的一个小区域为输入，进行动作分类。

#### 方法二

参考论文《Recognition of activities of daily living from egocentric videos using hands detected by a deep convolutional network》，使用网络检测手，然后通过kmeans生成全部动作的bag-of-visual words，通过KNN匹配。




