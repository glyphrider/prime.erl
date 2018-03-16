pipeline {
  agent {label 'docker-enabled'}
  
  stages {
    stage('Build') {
      steps {
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) --volumes-from=$(hostname) -w "${WORKSPACE}" library/erlang:19.3 erlc -DTEST prime.erl'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) --volumes-from=$(hostname) -w "${WORKSPACE}" library/erlang:19.3 erl -noshell -s prime test -s init stop'
      }
    }
  }
}
