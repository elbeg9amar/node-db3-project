const { where } = require('../data/db-config');
const db = require('../data/db-config')
module.exports = {
    find,
    findById,
    findSteps,
    add,
    remove,
    update,
    addStep
};

function find() {
   return db('schemes')
};

function findById(id) {
    return db('schemes')
        .where({id})
        .first()
};

function findSteps(id){
    return db('schemes')
        .where({id})
        .first()
        .then(s => {
            const id = s.id
           return  db('steps')
                .where('scheme_id', '=', id)
        });
};

function add(newScheme){
    return db('schemes')
        .insert(newScheme ,'id')
        .then(ids => {
            const id = ids[0]
            return findById(id)
        });
};

function addStep(body,id){
    return db('steps')
            .where('steps.scheme_id','=', id)
            .insert(body)
            .then(() => {
                return findSteps(id)
            });
};

function remove(id){
    return db('schemes')
        .where({id})
        .delete()
};

function update(changes, id){
    return db('schemes')
        .where({id})
        .update(changes)
        .then(() => {
            return findById(id)
        });
};
