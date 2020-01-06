#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#!/usr/bin/env python
import preprocessing
mysql = {'host': 'localhost',
         'user': 'piruzalemi',
         'passwd': 'Roshan2017',
         'db': 'ALEMIDEPT'}
preprocessing_queue = [preprocessing.scale_and_center,
                       preprocessing.dot_reduction,
                       preprocessing.connect_lines]
use_anonymous = True

