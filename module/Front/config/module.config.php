<?php

namespace Front;

return array(

    'router' => array(
        'routes' => array(
            'home' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/[page/:page]',
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
                ),
            ),

        )
    ),
    'controllers' => array(
        'invokables' => array(
            'Front\Controller\Index' => 'Front\Controller\IndexController',
            'Front\Controller\Status' => 'Front\Controller\StatusController',
            'Front\Controller\Post' => 'Front\Controller\PostController',
            'Front\Controller\Page' => 'Front\Controller\PageController',
        )
    ),
    'view_manager' => array(
        'template_map' => array(
            'layout/layout' => __DIR__. '/../view/front/layout/layout.phtml',
            'error/index' => __DIR__. '/../view/front/layout/error/index.phtml',
            'error/404' => __DIR__. '/../view/front/layout/error/404.phtml',
            'content/post' => __DIR__. '/../view/front/content/post.phtml',
            'content/page' => __DIR__. '/../view/front/content/page.phtml',
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
