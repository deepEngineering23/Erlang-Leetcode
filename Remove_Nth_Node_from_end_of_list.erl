%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec remove_nth_from_end(Head :: #list_node{} | null, N :: integer()) -> #list_node{} | null.


count(H,I)->
    if
        H#list_node.next == null -> I;
        true -> count(H#list_node.next,I+1)
    end 
.

add('null', Val) ->
    #list_node{val = Val, next = 'null'};
add(Node, Val) ->
    Node#list_node{next = add(Node#list_node.next, Val)}.

remove(Head,Target,X,Final)->

    if
      Head == 'null' -> Final;
      X /= Target-> remove(Head#list_node.next,Target,X+1,add(Final,Head#list_node.val));
      true -> remove(Head#list_node.next,Target,X+1,Final)
    end

.
remove_nth_from_end(Head, N) ->
    P = count(Head,1),
    if 
        N == P -> Head#list_node.next;
        true   -> Final = #list_node{val = Head#list_node.val , next = null},
        remove(Head#list_node.next,P-N,1,Final)
    end
.
