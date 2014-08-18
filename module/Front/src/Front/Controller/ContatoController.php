<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;

class ContatoController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {

    }

    /**
     *
     * @return EntityManager
     */
    protected function getEntityManager()
    {
        if (null === $this->entityManager)
            $this->entityManager = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');

        return $this->entityManager;
    }
}
