<?php

return array(
    'service_manager' => array(
         'abstract_factories' => array(
                'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
          )
    ),
    'caches' => array(
        'filesystem' => array(
            'adapter' => array(
                'name' => 'filesystem',
                'options' => array(
                    'dirLevel' => 1,
                    'cacheDir' => 'data/cache',
                    'dirPermission' => 0755,
                    'filePermission' => 0666,
                    'namespaceSeparator' => '-param-',
                    'namespace' => 'file',
                    'ttl' => '7200',
                ),
            ),
            'plugins' => array('serializer'),
        ),
        //Add yours caches types
    ),
);
