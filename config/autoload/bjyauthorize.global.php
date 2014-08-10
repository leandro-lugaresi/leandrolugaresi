<?php

return array(
    'bjyauthorize' => array(

        // set the 'guest' role as default (must be defined in a role provider)
        'default_role' => 'guest',

        'identity_provider' => 'ModulusAcl\Provider\Identity\ModulusUserIdentityProvider',

        'role_providers' => array(

            /* here, 'guest' and 'user are defined as top-level roles, with
             * 'admin' inheriting from user
             */
            'ModulusAcl\Provider\Role\RoleProvider' => array(),
        ),

        // resource providers provide a list of resources that will be tracked
        // in the ACL. like roles, they can be hierarchical
        'resource_providers' => array(
            'ModulusAcl\Provider\Resource\ResourceProvider' => array(),
            'BjyAuthorize\Provider\Resource\Config' => array(
                //'contentInterface' => array(),
            ),
        ),

        /* rules can be specified here with the format:
         * array(roles (array) , resource, [privilege (array|string), assertion])
         * assertions will be loaded using the service manager and must implement
         * Zend\Acl\Assertion\AssertionInterface.
         * *if you use assertions, define them using the service manager!*
         */
        'rule_providers' => array(
            'ModulusAcl\Provider\Rule\RuleProvider' => array(),
            // 'BjyAuthorize\Provider\Rule\Config' => array(
            //     'allow' => array(

            //     ),
            // ),
        ),

        // 'cache_options'         => array(
        //     'adapter' => array(
        //         'name'     =>'apc',
        //         'options'  => array(
        //             'namespaceSeparator'  => '-param-',
        //             'ttl' => '7200',
        //         )
        //     ),
        //     'plugins' => array(
        //         'exception_handler' => array(
        //             'throw_exceptions' => false
        //         ),
        //     ),
        // ),

        /* Currently, only controller and route guards exist
         *
         * Consider enabling either the controller or the route guard depending on your needs.
         */
        'guards' => array(
            'ModulusAcl\Guard\Modulus' => array(

            ),
            /* If this guard is specified here (i.e. it is enabled), it will block
             * access to all controllers and actions unless they are specified here.
             * You may omit the 'action' index to allow access to the entire controller
             */
            // 'BjyAuthorize\Guard\Controller' => array(
            //     array('controller' => 'ZFTool\Controller\Create', 'roles' => array('guest')),

            // ),
        ),
    ),
);
