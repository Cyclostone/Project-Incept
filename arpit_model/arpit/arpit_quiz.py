#!/usr/bin/env python
# coding: utf-8

# In[126]:


import pandas as pd


# In[127]:


l=pd.read_csv("a1.csv",header=None)


# In[128]:


p=l.iloc[:,:].values


# In[129]:


data=p[1:,:]


# In[130]:


x=data[:,:-1].astype(float)
y=data[:,-1]


# In[131]:


type(x[0][0])


# In[132]:


print(x.shape)
print(y.shape)


# In[133]:


from keras.models import Sequential
from keras.layers import Dense
from keras.utils import np_utils
from sklearn.preprocessing import LabelEncoder


# In[134]:


from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)


# In[135]:


le=LabelEncoder()
le.fit(y_train)
encoded_y_train=le.transform(y_train)
one_hot_y_train=np_utils.to_categorical(encoded_y_train)


# In[136]:


le.fit(y_train)
encoded_y_test=le.transform(y_test)
one_hot_y_test=np_utils.to_categorical(encoded_y_test)


# In[137]:


one_hot_y_test.shape


# In[157]:


model=Sequential()
model.add(Dense(36,input_dim=18,activation='tanh'))
model.add(Dense(15,activation='softmax'))
model.compile(loss='categorical_crossentropy',optimizer='adam',metrics=['accuracy'])


# In[244]:


model.fit(x_train,one_hot_y_train,epochs=40)


# In[245]:


prediction = model.predict_classes(x_test[0].reshape(1,18))
prediction_ = np.argmax(np_utils.to_categorical(predictions), axis = 1)
predicted_label = str(le.inverse_transform(prediction_)[0])


# In[246]:


str(predicted_label)


# In[247]:


model.save("model.h5")


# In[248]:


from keras.models import load_model


# In[249]:


model_=load_model("model.h5")


# In[250]:


user_input=np.array([0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 1., 0., 1., 0., 0., 0., 0.,
       0.])


# In[251]:


prediction = model_.predict_classes(user_input.reshape(1,18))
prediction_ = np.argmax(np_utils.to_categorical(prediction), axis = 1)
predicted_label = str(le.inverse_transform(prediction_)[0])


# In[252]:


predicted_label


# In[253]:


x_test[2]


# In[254]:


k=model.predict_classes(x_test[2].reshape(1,18))
t=np.argmax(np_utils.to_categorical(k), axis = 1)
le.inverse_transform(t)


# In[255]:


le.transform(y_test)


# In[ ]:




