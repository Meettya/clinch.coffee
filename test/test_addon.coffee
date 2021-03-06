###
Test suite for addon
###
_     = require 'lodash'
fs    = require 'fs'
path  = require 'path'
vm    = require 'vm'

lib_path = GLOBAL?.lib_path || ''

fixtures        = path.join __dirname, "fixtures"
fixturesCoffee  = path.join fixtures,  "summator.coffee"
fixturesErr     = path.join fixtures,  "with_error.coffee"

# get addon
adon_file  = 'addon'
addon_path = path.join lib_path, adon_file
Compiller  = require addon_path

READ_OPTIONS = encoding : 'utf8'

describe 'Addon:', ->

  describe 'itself', ->

    it 'should export "extension" and "processor"', ->
      expect(Compiller).to.have.all.keys ['extension', 'processor']

    it 'should export string as "extension"', ->
      expect(Compiller.extension).to.be.a 'string'

    it 'should export function as "processor"', ->
      expect(Compiller.processor).to.be.a 'function'

  describe 'as addon', ->

    it 'should export correct file extension ".coffee"', ->
      expect(Compiller.extension).to.equal '.coffee'

    it 'should compile correct CS file', (done) ->
      fs.readFile fixturesCoffee, READ_OPTIONS, (err, data) ->
        expect(err).to.be.null
        expect(data).to.be.a 'string'
        Compiller.processor data, fixturesCoffee, (err, code) ->
          expect(err).to.be.null
          expect(code).to.be.a 'string'
          # test result
          vm.runInNewContext code, sandbox = module:exports:{}
          sum_fn = sandbox.module.exports.sum
          expect(sum_fn 2, 5).to.equal 7

          done()

    it 'should return error on incorrect CS file', (done) ->
      fs.readFile fixturesErr, READ_OPTIONS, (err, data) ->
        expect(err).to.be.null
        expect(data).to.be.a 'string'
        Compiller.processor data, fixturesErr, (err, code) ->
          expect(err).to.be.an.instanceof SyntaxError
          # console.log err
          done()
