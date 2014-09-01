<?php

namespace Front\Form;

use ModulusForm\Form\FormDefault,
    Zend\Form\Element\Select;

class ProdutoTemplate extends FormDefault
{

    public function addElements()
    {

        $this->add(array(
            'name' => 'entity',
            'type' => 'Zend\Form\Element\Hidden',
        ));

        $this->add(array(
            'name' => 'entityId',
            'type' => 'Zend\Form\Element\Hidden',
        ));

        $this->add(array(
            'name' => 'urlProject',
            'options' => array(
                'label' => 'Url do projeto: ',
            ),
            'type' => 'Zend\Form\Element\Url',
        ));

        $this->add(array(
            'name' => 'date',
            'options' => array(
                'label' => 'Data do projeto: ',
            ),
            'type' => 'Zend\Form\Element\Date',
        ));
    }

    public function addInputFilter()
    {

    }
}
