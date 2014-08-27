<?php

namespace Front;

return array(

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
                    'blog' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route'    => 'blog[/category/:category][/page/:page]',
                            'constraints' => array(
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'category'     => '[a-zA-Z][a-zA-Z0-9_-]*',
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
