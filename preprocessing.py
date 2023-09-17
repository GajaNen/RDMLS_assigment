# -*- coding: utf-8 -*-
"""
Created on Mon Nov 28 22:00:00 2022

@author: Gaja
"""
import pandas as pd

datapath = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"

dat = pd.read_csv(datapath + "/prices.csv", decimal=',')
dat["utc_timestamp"] = pd.to_datetime(dat["utc_timestamp"],
                                      format="%Y-%m-%dT%H:%M:%SZ")
dat['id'] = dat.index + 1


dat.to_csv(datapath + "/prices_correct.csv",
           index=False,
           decimal='.')

dat2 = pd.read_csv(datapath + "/weather_data.csv")
dat2["utc_timestamp"] = pd.to_datetime(dat2["utc_timestamp"],
                                      format="%Y-%m-%dT%H:%M:%SZ")
dat2['id'] = dat2.index + 1
dat2.to_csv(datapath + "/weather_correct.csv",
            index=False)


# transform the data into long format
dat2 = pd.wide_to_long(dat2, stubnames=["AT", "BE", "BG"], i="id",
                       j="fundament", sep="_", suffix='\\w+').reset_index()
dat2 = pd.melt(dat2, id_vars=['id', 'fundament', 'utc_timestamp'],
               var_name='country')

dat2 = dat2.drop(['id'], axis=1)

dat2.to_csv(datapath + "/weather_long.csv",
            index_label='id')


dat = pd.wide_to_long(dat, stubnames=["AT", "BE", "BG"], i="id",
                       j="fundament", sep="_", suffix='\\w+').reset_index()
dat = pd.melt(dat, id_vars=['id', 'fundament', 'utc_timestamp'],
              var_name='country')
dat = dat.drop('id', axis=1)
dat.to_csv(datapath + '/prices_long.csv',
           index_label='id')

