clear all; close all; clc;
load('red.mat');
x = irisInputs(:,20);
y = net(x)