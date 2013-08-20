#!/usr/bin/env bash

##Aliases
alias ar='autorep'
alias arj='autorep -j'


##Functions

#list the jil for a job or all jobs matching a glob
function arjq(){
	job=$1
	autorep -j "${job}" -q
}

#details
function arjd(){
	job=$1
	autorep -j "${job}" -d
}

#Interact with jobs
function startjob(){
	job=$1
	sendevent -j "${job}" -e STARTJOB 
}

function forcestart(){
	job=$1
	sendevent -j "${job}" -e FORCE_STARTJOB
}

function killjob(){
		job=$1
		sendevent -j ${job} -e KILLJOB
}

function onhold(){
		job=$1
		sendevent -j "${job}" -e JOB_ON_HOLD
}

function offhold(){
		job=$1
		sendevent -j "${job}" -e JOB_OFF_HOLD
}

function on-ice(){
		job=$1
		sendevent -j "${job}" -e JOB_ON_ICE
}

function off-ice(){
		job=$1
		sendevent -j "${job}" -e JOB_OFF_ICE
}

function chstat(){
		job=$1
		status=$2
		sendevent -j "${job}" -e CHANGE_STATUS -s "${status}"
}

#List jobs in status
function fajobs(){ autorep -j "*" | grep " FA " }
function tejobs(){ autorep -j "*" | grep " TE " }
function icejobs(){ autorep -j "*" | grep " OI " }
function holdjobs(){ autorep -j "*" | grep " OH " }

#autoping does not allow you to ping wildcards -workaround
function sysping(){
	pattern=$1
	autoping -m ALL | grep "$pattern"
}
