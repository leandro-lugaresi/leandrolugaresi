<?php

return array(
    'modulus_base' => array(
        'partialMenu' => 'partials/menuAcl.phtml',
        'componentsOptions' => array(
            'ModulusContent\Model\Page' => array(
                'gallery' => true,
                'metatags' => true,
                'configTemplate' => array(
                    'enable' => true,
                    'form' => 'ModulusContent\Form\PagesTemplate',
                ),
            ),
            'ModulusContent\Model\Post' => array(
                'gallery' => true,
                'metatags' => true,
                'configTemplate' => array(
                    'enable' => true,
                    'form' => 'ModulusContent\Form\PagesTemplate',
                ),
            ),
            'ModulusProducts\Model\Products' => array(
                'gallery' => true,
                'metatags' => true,
            ),
        ),
    ),
    'modulus_cache' => array(
        \ModulusCache\Service\Cache::CACHE_FAST => 'filesystem',
        \ModulusCache\Service\Cache::CACHE_DISTRIBUTED => 'filesystem',
        \ModulusCache\Service\Cache::CACHE_SLOW => 'filesystem',
        \ModulusCache\Service\Cache::CACHE_DEFAULT => 'filesystem',
        'router_cache' => array(
            'cache'  => 'filesystem',
            'cache_prefix' => 'pages',
            'routes'  => array(
                //'home' => array('match_method' => 'GET'),
                //'home/content' => array('match_method' => 'GET'),
                // 'home/default' => array(
                //         'match_method' => 'GET',
                //         'exclude_match_route_params' => array(
                //             'action' => array('ok'),
                //         )),
            ),
        )

    ),
);
