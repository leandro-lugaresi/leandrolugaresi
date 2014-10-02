<?php
return array(
    'modulus_crud' => array(
        'defaultReadTemplate' => 'modulus-ui/crud/read',
        'defaultCreateTemplate' => 'modulus-ui/crud/create',
        'defaultUpdateTemplate' => 'modulus-ui/crud/update',
        'defaultViewTemplate' => 'modulus-ui/crud/view',
    ),
    'view_manager' => array(
        'template_map' => array(
            'modulus-ui/crud/read'   => __DIR__ . '/../view/modulus-ui/crud/read.phtml',
            'modulus-ui/crud/create' => __DIR__ . '/../view/modulus-ui/crud/create.phtml',
            'modulus-ui/crud/update' => __DIR__ . '/../view/modulus-ui/crud/update.phtml',
            'modulus-ui/crud/view' => __DIR__ . '/../view/modulus-ui/crud/view.phtml',
            'modulus-ui/crud/form'   => __DIR__ . '/../view/modulus-ui/crud/form.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
);
