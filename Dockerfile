FROM rabbitmq:3.8-management-alpine

ADD join.sh /

RUN sed -i 's/exec "$@"/\
    sh -c "while ! (nc -z 0.0.0.0 15672 || nc -z localhost 15672); do sleep 0.1; done; sleep 3; .\/join.sh" \&\
    \nexec "$@"/' /usr/local/bin/docker-entrypoint.sh
