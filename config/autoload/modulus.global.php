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
            'ModulusContent\Controller\ContentController:3' => array(
                'gallery' => true,
                'metatags' => true,
                'configTemplate' => array(
                    'enable' => true,
                    'form' => 'Front\Form\PortfolioTemplate',
                ),
            ),
            'ModulusContent\Controller\ContentController:1' => array(
                'gallery' => true,
                'metatags' => true,
                'configTemplate' => array(
                    'enable' => true,
                    'form' => 'ModulusContent\Form\PagesTemplate',
                ),
            ),
            'ModulusContent\Controller\ContentController:2' => array(
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
                'configTemplate' => array(
                    'enable' => true,
                    'form' => 'Front\Form\ProdutoTemplate',
                ),
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
                // 'home' => array('match_method' => 'GET'),
                // 'home/content' => array('match_method' => 'GET'),
                // 'home/blog' => array(
                //         'match_method' => 'GET',
                //         'exclude_match_route_params' => array(
                //             'search' => 'true',
                //         )),
                // 'home/produtos' => array('match_method' => 'GET'),
                // 'home/produtos/visualizar' => array('match_method' => 'GET'),
                // 'home/projetos' => array('match_method' => 'GET'),
            ),
        )

    ),
);
