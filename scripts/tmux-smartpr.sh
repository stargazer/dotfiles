#!/bin/bash
SMARTPR_BUILD_DIR=/home/stargazer/Development/nescio/smartpr-build
SMARTPR_API_DIR=$SMARTPR_BUILD_DIR/shared/api01/venv3/src/smartpr-api
SMARTPR_ANALYTICS_DIR=$SMARTPR_BUILD_DIR/shared/analytics
SMARTPR_DOC_DIR=/home/stargazer/Development/nescio/smartpr-doc

cd $SMARTPR_BUILD_DIR
tmux new-session -s 'smartpr' -n 'smartpr-build'\; \
     split-window -v -c $SMARTPR_BUILD_DIR \; \
     select-pane -U \; \
     split-window -h -c $SMARTPR_BUILD_DIR \; \
     select-pane -R \; \
     \
     new-window -n 'smartpr-api' -c $SMARTPR_API_DIR \; \
     split-window -h -c $SMARTPR_API_DIR \; \
     select-pane -L \; \
     split-window -v -c $SMARTPR_API_DIR \; \
     select-pane -U \; \
     \
     new-window -n 'smartpr-analytics' -c $SMARTPR_ANALYTICS_DIR \; \
     split-window -h -c $SMARTPR_ANALYTICS_DIR \; \
     select-pane -L \; \
     split-window -v -c $SMARTPR_ANALYTICS_DIR \; \
     select-pane -U \; \
     \
     new-window -n 'smartpr-doc' -c $SMARTPR_DOC_DIR \; \
     split-window -h -c $SMARTPR_DOC_DIR \; \
     select-pane -L \; \
     \
     select-window -t 1 \; \
    
