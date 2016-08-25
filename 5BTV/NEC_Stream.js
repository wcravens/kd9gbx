#!/bin/env node

var Transform = require( 'stream' ).Transform
  , parse = new Transform()
;

parse._trasform = function( data, encoding, done) {
  this.push( data )
  done();
};

process.stdin
  .pipe( parser )
  .pile( process.stdout );

process.stdout.on( 'error', process.exit );
