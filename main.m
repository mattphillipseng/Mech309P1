%% MECH 309 Mini-Project 1
% Starter code by Prof. Forbes
% 2019/01/08

% Modified by Matthew Phillips
% Student ID: 260689202

% Modified by Jarred Brown
% Student ID: 260688463

close all
clear all
clc

% Format of output
% format short
format long

%% Load data
orbital_constants
load('measurements.mat');
whos

%% Solve orbit determination problem
[rg1,vg1,ref_h] = find_v_given_position_data(r_g_at_t1,r_g_at_t2,t1,t2)

%% Solve for orbital elements
% This is ``p-code", protected code. 
[a,e,Omega,inc,omega,t0] = orbital_elements(rg1,vg1) 

%% Plot orbit
[T_hr,r_g,v_g] = plot_orbit(a,e,Omega,inc,omega,t0);

%% Perform conservation check for angular momentum
conservation_check_plot
