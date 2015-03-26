[![Dependency Status](https://gemnasium.com/Meettya/clinch.coffee.svg)](https://gemnasium.com/Meettya/clinch.coffee)
[![Build Status](https://travis-ci.org/Meettya/clinch.coffee.svg?branch=master)](https://travis-ci.org/Meettya/clinch.coffee)

# clinch.coffee

This is external addon for [clinch](https://github.com/Meettya/clinch) - CommonJS to browser packer to support ```.coffee``` files.

## How to use

    Clinch = require 'clinch'
    clinch_coffee = require 'clinch.coffee'

    # create packer object
    packer = new Clinch runtime : on
    # add plugin (chainable)
    packer.addPlugin clinch_coffee

For more information see main module documentation.
