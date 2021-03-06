<?php

namespace Front;

return array(

    'asset_manager' => array(
        'resolver_configs' => array(
            'collections' => array(
                'front/css/all.css' => array(
                    '/front/css/bootstrap.css',
                    '/front/css/settings.css',
                    '/front/css/owl.carousel.css',
                    '/front/js/google-code-prettify/prettify.css',
                    '/front/js/fancybox/jquery.fancybox.css',
                    '/front/js/fancybox/helpers/jquery.fancybox-thumbs.css',
                    '/front/css/style.css',
                    '/front/css/color/red.css',
                ),
                'front/js/all.js' => array(
                    '/front/js/jquery.min.js',
                    '/front/js/bootstrap.min.js',
                    '/front/js/twitter-bootstrap-hover-dropdown.min.js',
                    '/front/js/jquery.easytabs.min.js',
                    '/front/js/owl.carousel.min.js',
                    '/front/js/jquery.isotope.min.js',
                    '/front/js/jquery.fitvids.js',
                    '/front/js/jquery.fancybox.pack.js',
                    '/front/js/fancybox/helpers/jquery.fancybox-thumbs.js',
                    '/front/js/fancybox/helpers/jquery.fancybox-media.js',
                    '/front/js/jquery.slickforms.js',
                    '/front/js/instafeed.min.js',
                    '/front/js/retina.js',
                    '/front/js/google-code-prettify/prettify.js',
                    '/front/js/scripts.js',
                ),
            ),
            'paths' => array(
                __DIR__ . '/../public',
            ),
        ),
        'caching' => array(
            'front/js/all.js' => array(
                'cache'     => 'AssetManager\\Cache\\FilePathCache',
                'options' => array(
                    'dir' => './data/cache', // path/to/cache
                ),
            ),
            'front/css/all.css' => array(
                'cache'     => 'AssetManager\\Cache\\FilePathCache',
                'options' => array(
                    'dir' => './data/cache', // path/to/cache
                ),
            ),
        ),
    ),

    'router' => array(
        'routes' => array(
            'home' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/',
                    'constraints' => array(
                        'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                        'page'     => '[0-9]+',
                        'params' => '(.*)'
                    ),
                    'defaults' => array(
                        'controller' => 'Front\Controller\Index',
                        'action'     => 'index',
                        'page' => 1,
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'projetos' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route'    => 'projetos',
                            'constraints' => array(
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'     => '[0-9]+',
                                'params' => '(.*)'
                            ),
                            'defaults' => array(
                                'controller' => 'Front\Controller\Portfolio',
                                'action'     => 'index',
                            ),
                        ),
                    ),
                    'produtos' => array(
                        'type' => 'Literal',
                        'options' => array(
                            'route'    => 'produtos',
                            'constraints' => array(
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'     => '[0-9]+',
                                'params' => '(.*)'
                            ),
                            'defaults' => array(
                                'controller' => 'Front\Controller\Produtos',
                                'action'     => 'index',
                            ),
                        ),
                        'may_terminate' => true,
                        'child_routes' => array(
                            'visualizar' => array(
                                'type' => 'Segment',
                                'options' => array(
                                    'route'    => '/visualizar[/:id[/:produto]]',
                                    'constraints' => array(
                                        'id'     => '[0-9]+',
                                        'produto' => '(.*)'
                                    ),
                                    'defaults' => array(
                                        'controller' => 'Front\Controller\Produtos',
                                        'action'     => 'view',
                                    ),
                                ),
                            ),
                        ),
                    ),
                    'blog' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route'    => 'blog[/page/:page][/category/:category]',
                            'constraints' => array(
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'category'     => '(.*)',
                                'id'     => '[0-9]+',
                                'page'     => '[0-9]+',
                                'params' => '(.*)'
                            ),
                            'defaults' => array(
                                'controller' => 'Front\Controller\Blog',
                                'action'     => 'index',
                            ),
                        ),
                    ),
                    'contato' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route'    => 'contato',
                            'constraints' => array(
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'category'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'     => '[0-9]+',
                                'page'     => '[0-9]+',
                                'params' => '(.*)'
                            ),
                            'defaults' => array(
                                'controller' => 'Front\Controller\Contato',
                                'action'     => 'index',
                            ),
                        ),
                    ),
                ),
            ),

        )
    ),
    'controllers' => array(
        'invokables' => array(
            'Front\Controller\Index' => 'Front\Controller\IndexController',
            'Front\Controller\Contato' => 'Front\Controller\ContatoController',
            'Front\Controller\Portfolio' => 'Front\Controller\PortfolioController',
            'Front\Controller\Produtos' => 'Front\Controller\ProdutosController',
            'Front\Controller\Blog' => 'Front\Controller\BlogController',
        )
    ),
    'view_manager' => array(
        'template_map' => array(
            'layout/layout' => __DIR__. '/../view/front/layout/layout.phtml',
            'error/index' => __DIR__. '/../view/front/layout/error/index.phtml',
            'error/404' => __DIR__. '/../view/front/layout/error/404.phtml',
            'content/post' => __DIR__. '/../view/front/content/post.phtml',
            'content/page' => __DIR__. '/../view/front/content/page.phtml',
            'content/portfolio' => __DIR__. '/../view/front/content/portfolio.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
    'module_view_manager' => array(
        'Front' => array(
            'layout' => 'layout/layout',
            'exception_template' => 'error/index',
            'not_found_template' => 'error/404',
        ),
    ),
);
