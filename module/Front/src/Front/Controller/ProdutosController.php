<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;

class ProdutosController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {
        $config = $this->modulusConfig()->getConfig('modulus_content');
        $repository = $this->getEntityManager()->getRepository('ModulusProducts\Entity\Products');
        $categoryRepository = $this->getEntityManager()->getRepository('ModulusProducts\Entity\ProductsCategory');

        $categorys = $categoryRepository->findAll();
        $produtos = $repository->findAll();

        return new ViewModel(array(
            'produtos' => $produtos,
            'categorys' => $categorys,
        ));
    }

    public function viewAction()
    {
        $config = $this->modulusConfig()->getConfig('modulus_content');
        $repository = $this->getEntityManager()->getRepository('ModulusProducts\Entity\Products');

        $entity = $repository->findOneById($this->params()->fromRoute('id'));

        if (!is_object($entity)) {
            $response = $this->getResponse();
            $response->setStatusCode(404);

            return $this->getEvent()->setResult('Conteúdo indisponivel!');
        }

        return new ViewModel(array(
            'entity' => $entity,
        ));
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
