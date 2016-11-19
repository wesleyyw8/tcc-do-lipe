module.exports = function(grunt){
  grunt.initConfig({
    concat:{
      js:{
        src: ['ui/controllers/*.js'],
        dest: 'ui/application.js'
      }
    },
    watch: {
      scripts: {
        files: ['ui/controllers/*.js'],
        tasks: ['concat:js']
      },
      livereload: {
        options: {
          livereload: true
        },
        files: ['ui/controllers/*.js']
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', ['concat:js','watch']);
}