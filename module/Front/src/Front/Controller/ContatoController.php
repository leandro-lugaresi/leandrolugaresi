<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;

class ContatoController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {
        $form = new \Front\Form\Contact();
        $form->configure();
        $prg     = $this->prg();

        if ($prg instanceof \Zend\Http\Response) {
            return $prg;
        } elseif (false !== $prg) {

            $form->setData($prg);

            if ($form->isValid()) {
                $data = $form->getData();
                unset($data['security']);
                unset($data['submit']);
                $data['subject'] = 'Novo Contato: '.$data['name'];
                $this->getEventManager()->trigger('sendContact', $this, array('data' => $data));
                $this->Notification()->success('Sua mensagem foi enviada com sucesso!');

                return $this->redirect()->toRoute('home/contato');
            }
        }

        return new ViewModel(array('form' => $form));
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
