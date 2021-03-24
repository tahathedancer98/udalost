<?php

namespace udalost\webapp\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  

class Utilisateur extends Model {
  protected $table = 'utilisateur';
  protected $primaryKey = 'id';
	public $incrementing = false;   // pas d'auto incrementation
	public $keyType = 'string';		// id sous forme de string

  public function evenements() {
		return $this->belongsToMany('udalost\webapp\models\Evenement', // Table cible
	           						'participant', // Table Pivot
	           						'id_utilisateur', // Foreign Key cible de la table pivot
	        						'id_evenement') //Foreign Key assoc 
					->withPivot(['id','nom','status','message','id_evenement','id_utilisateur']);
	}
} 