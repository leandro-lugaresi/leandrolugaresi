<?php
namespace Front;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getViewHelperConfig()
    {
        return array(
            'factories' => array(
                'recentPosts' => function ($sm) {
                    $serviceLocator = $sm->getServiceLocator();
                    $entityManager = $serviceLocator->get('Doctrine\ORM\EntityManager');
                    $configService = $serviceLocator->get('ModulusConfig\Service\Config');

                    $helper = new View\Helper\RecentPosts(
                        $entityManager->getRepository('ModulusContent\Entity\SiteContent'),
                        $configService->getConfig('modulus_content')
                    );

                    return $helper;
                },
                'sidebarCategorys' => function ($sm) {
                    $serviceLocator = $sm->getServiceLocator();
                    $entityManager = $serviceLocator->get('Doctrine\ORM\EntityManager');
                    $configService = $serviceLocator->get('ModulusConfig\Service\Config');

                    $helper = new View\Helper\SidebarCategorys(
                        $entityManager->getRepository('ModulusContent\Entity\ContentCategorys')
                    );

                    return $helper;
                },
            ),
        );
    }

}
