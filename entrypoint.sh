#!/bin/sh -l

cf install-plugin multiapps -f

cf api "$INPUT_CF_API"

if [ -n "$INPUT_CF_ORIGIN" ]; then
  cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD" --origin "$INPUT_CF_ORIGIN"
else
  cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"
fi

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

sh -c "cf $*"
